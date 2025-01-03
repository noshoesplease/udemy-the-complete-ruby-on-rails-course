class Artifact < ApplicationRecord
  attr_accessor :upload
  belongs_to :project

  MAX_FILESIZE = 10.megabytes
  validates_presence_of :name, :upload
  validates_uniqueness_of :name

  validate :uploaded_file_size

  private
  def uploaded_file_size
    if upload
      errors.add(:upload, "File size must be less than 10MB") unless upload.size <= MAX_FILESIZE
    end
  end
end
