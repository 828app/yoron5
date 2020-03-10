class YoronValidator < ActiveModel::EachValidator
  def validate(record)
    record.errors[:yoron3] << 'Yoron3を埋めてください' if record.yoron3.blank? && record.yoron4.present?
    record.errors[:yoron3] << 'Yoron3を埋めてください' if record.yoron3.blank? && record.yoron5.present?
    record.errors[:yoron3] << 'Yoron3を埋めてください' if record.yoron3.blank? && record.yoron6.present?
    record.errors[:yoron3] << 'Yoron3を埋めてください' if record.yoron3.blank? && record.yoron7.present?
    record.errors[:yoron4] << 'Yoron4を埋めてください' if record.yoron4.blank? && record.yoron5.present?
    record.errors[:yoron4] << 'Yoron4を埋めてください' if record.yoron4.blank? && record.yoron6.present?
    record.errors[:yoron4] << 'Yoron4を埋めてください' if record.yoron4.blank? && record.yoron7.present?
    record.errors[:yoron5] << 'Yoron5を埋めてください' if record.yoron5.blank? && record.yoron6.present?
    record.errors[:yoron5] << 'Yoron5を埋めてください' if record.yoron5.blank? && record.yoron7.present?
    record.errors[:yoron6] << 'Yoron6を埋めてください' if record.yoron6.blank? && record.yoron7.present?
  end
end