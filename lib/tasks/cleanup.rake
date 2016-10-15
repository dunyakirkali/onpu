# cleanup.rake
namespace :cleanup do
  desc 'cleanup old images'
  task images: :environment do
    Image.old.destroy_all
  end

  desc 'cleanup old audios'
  task audios: :environment do
    Audio.old.destroy_all
  end
end
