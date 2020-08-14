FactoryBot.define do
  factory :article1, class: BookArticle do
    title { 'first article title' }
    text { 'New article text' }
    user_id { 1 }
    image { File.new(Rails.root.join('app', 'assets', 'images', 'coachella.jpg')) }
  end
  factory :article2, class: BookArticle do
    title { 'second article title' }
    text { 'New article text' }
    user_id { 1 }
    image { File.new(Rails.root.join('app', 'assets', 'images', 'coachella.jpg')) }
  end
  factory :article3, class: BookArticle do
    title { 'third article title' }
    text { 'New article text' }
    user_id { 1 }
    image { File.new(Rails.root.join('app', 'assets', 'images', 'coachella.jpg')) }
  end
  factory :article4, class: BookArticle do
    title { 'fourth article title' }
    text { 'New article text' }
    user_id { 1 }
    image { File.new(Rails.root.join('app', 'assets', 'images', 'coachella.jpg')) }
  end
end
