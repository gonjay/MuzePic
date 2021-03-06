class Image < ActiveRecord::Base
  validates_uniqueness_of :img_src

  def info
    if self.size
      "#{self.width} * #{self.height} #{sizeFormat}"
    else
      ""
    end
  end

  def isBig?
    # true if self.height > 2000
    if self.height
      return true if self.height > 2000
    end
    false
  end

  def sizeFormat
    if self.size/1000000 == 0
      return "#{self.size/1000}KB"
    else
      return "#{self.size/1000000}MB"
    end
  end

  def gif?
    return img_src.include?".gif" if img_src
  end

end
