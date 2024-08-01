# frozen_string_literal: true

class Album < ApplicationRecord
  before_validation :generate_slug

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true
  has_many_attached :photos do |attachable|
    attachable.variant :thumb, resize_to_limit: [250, 250]
    attachable.variant :medium, resize_to_limit: [512, 512]
    attachable.variant :large, resize_to_limit: [720, nil]
  end

  def to_param = slug

  def add_photos(photos)
    photos.each do |photo|
      self.photos.attach(photo)
    end
    true
  rescue ActiveStorage::AttachmentInvalid
    false
  end

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
