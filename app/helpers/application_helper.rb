module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def question_hashtags(question)
    question.hashtags.map do |hashtag|
      link_to("##{hashtag.name}", hashtag_path(hashtag))
    end.join(' ').html_safe
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
