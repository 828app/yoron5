
class TopicsController < ApplicationController
  helper_method :comment

  def index
    @topics = Topic.page(params[:page]).per(15).order('recent DESC')
  end

  def new # 新着順に並べるページ。新規投稿ではない
    @topics = Topic.page(params[:page]).per(15).order('created_at DESC')
  end

  def show
    @@topicid = Topic.find(params[:id])
    @topic = Topic.find(params[:id])
    @ips = Ip.where(created_at: 24.hours.ago..Time.now, topic_id: @topic.id).pluck(:ip) # 24時間以内にトピックに対して投票した人間のip取得
    @comips = Comment.where(created_at: 2.minutes.ago..Time.now, topic_id: @topic.id).pluck(:ip)
    @comment = Comment.new # show.html.erb内でコメントを書くため
    @comments = @topic.comments.page(params[:page]).per(100).order('created_at ASC')    #コメント
    @yorons = [] # yoronのための配列を作成
    @polls = [@topic.poll1, @topic.poll2, @topic.poll3, @topic.poll4, @topic.poll5, @topic.poll6, @topic.poll7] # 投票数のための配列

    # グラフ下部表示用のyorons配列を追加
    @yorons.push(@topic.yoron1)
    @yorons.push(@topic.yoron2)
    # yoron2までは投稿必須だがyoron3以降は任意となる。yroon3以降が空の場合は@pollsの配列から@topic.poll3以降の配列を削除。
    if @topic.yoron3.blank?
      @polls.slice!(2, 6)
    else
      @yorons.push(@topic.yoron3)
    end
    if @topic.yoron4.blank?
      @polls.slice!(3, 5)
    else
      @yorons.push(@topic.yoron4)
    end
    if @topic.yoron5.blank?
      @polls.slice!(4, 4)
    else
      @yorons.push(@topic.yoron5)
    end
    if @topic.yoron6.blank?
      @polls.slice!(5, 3)
    else
      @yorons.push(@topic.yoron6)
    end
    if @topic.yoron7.blank?
      @polls.delete_at(6)
    else
      @yorons.push(@topic.yoron7)
    end
    # jsonに変換
    @yorons_j = @yorons.to_json.html_safe
    @polls_j = @polls.to_json.html_safe
  end

  #検索
  def search
     @keyword = params[:keyword]
     @topics = Topic.where("title LIKE ?", "%#{@keyword}%").page(params[:page]).per(15).order('created_at DESC')
  end

  # 新規トピック投稿画面
  def newpost
    @topic = Topic.new
    @topicips = Topic.where(created_at: 3.hours.ago..Time.now).pluck(:ip) # ３時間以内に投稿されたトピックの投稿者ipを取得
  end

  # 新規トピック作成
  def create
    @topic = Topic.new(create_params)
    if @topic.save
      redirect_to action: :topicposted
    else
      @topicips = Topic.where(created_at: 3.hours.ago..Time.now).pluck(:ip) # ３時間以内に投稿されたトピックの投稿者ipを取得
      render 'newpost' # バリデーションエラー時
    end
  end

  # コメント
  def comment
    @comment = Comment.new(comment_params)
    if @comment.save
      @com = @@topicid.coms
      @com += 1
      @recent = Comment.where(created_at: 1.months.ago..Time.now, topic_id: @@topicid.id) # １ヶ月以内に特定のトピックに投稿されたコメントを全部取得
      @recentnum = @recent.length # コメントの数を取得
      @@topicid.update(coms: @com, recent: @recentnum)
      redirect_to action: 'aftercomment'
    else
      render 'show'
    end
  end

  #コメント投稿後のページ
  def aftercomment
    @id = @@topicid.id
  end

  # 投票したときに投票数をプラスする
  def update
    @topic = Topic.find(params[:id])
    # 同じIPで投票させない機能
    @ips = Ip.where(created_at: 24.hours.ago..Time.now, topic_id: @topic.id).pluck(:ip)
    if @ips.include?(request.remote_ip) == false
      @topic.pollnum += 1 # 合計の投票数をプラス１
      @topic.update(poll_update) # 投票数をアップデート
      if @topic.poll == @topic.yoron1
        @topic.poll1 += 1
      elsif @topic.poll == @topic.yoron2
        @topic.poll2 += 1
      elsif @topic.poll == @topic.yoron3
        @topic.poll3 += 1
      elsif @topic.poll == @topic.yoron4
        @topic.poll4 += 1
      elsif @topic.poll == @topic.yoron5
        @topic.poll5 += 1
      elsif @topic.poll == @topic.yoron6
        @topic.poll6 += 1
      else @topic.poll == @topic.yoron7
           @topic.poll7 += 1
      end
      @topic.save!
      # 投票者のIPをipを記録
      ip = Ip.new
      ip.ip = request.remote_ip
      ip.topic_id = @topic.id
      ip.save
      # リダイレクト
      redirect_to action: 'show'
    else
      redirect_to action: 'index'
    end
  end

  def tweet
    
  end

  def login

  end
  private
# コメントテーブルのidカラムテーブルに入れる（Topicテーブル内でこの操作をしているための処置）
  def comment_params
    params[:comment]['topic_id'] = @@topicid.id
    params[:comment]['ip'] = request.remote_ip
    params[:comment]['num'] = @@topicid.coms + 1 # トピック内でのコメントの番号を記入
    params[:comment]['name'] = '匿名' if params[:comment]['name'].blank?
    params.require(:comment).permit(:name, :text, :topic_id, :ip, :num)
  end

  def create_params
    params[:topic]['ip'] = request.remote_ip
    params[:topic]['poll1'], params[:topic]['poll2'], params[:topic]['poll3'], params[:topic]['poll4'], params[:topic]['poll5'], params[:topic]['poll6'],params[:topic]['poll7'] = 0,0,0,0,0,0,0,0
    params[:topic]['coms'], params[:topic]['pollnum'],params[:topic]['recent'] = 0,0,0
    params[:topic]['name'] = '匿名' if params[:topic]['name'].blank?
    params.require(:topic).permit(:title, :text, :name, :yoron1, :yoron2, :yoron3, :yoron4, :yoron5, :yoron6, :yoron7, :poll1, :poll2, :poll3, :poll4, :poll5, :poll6, :poll7, :pollnum, :coms, :recent, :ip)
  end

  def poll_update
    params.require(:topic).permit(:poll)
  end
end
