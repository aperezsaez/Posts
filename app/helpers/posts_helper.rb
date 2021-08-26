module PostsHelper
  def hashtag(content)
    hash = content.split(" ")
    words = []
      hash.each do |twt|
        if twt.start_with?("#")
          twt = link_to twt, controller: "posts", q: twt
        end
        words.push(twt)
      end
      raw words.join(" ")
  end
end
