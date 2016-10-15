# cleanup.rake
namespace :cleanup do
  desc 'cleanup old images'
  task images: :environment do
    #:nocov:
    Image.old.destroy_all
    #:nocov:
  end

  desc 'cleanup old audios'
  task audios: :environment do
    #:nocov:
    Audio.old.destroy_all
    #:nocov:
  end
end
