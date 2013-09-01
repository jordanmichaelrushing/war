module PostsHelper
  def posts_chart_data
    (Post.find(1).created_at.to_date..Date.today).map do |date|
      {
        created_at: date,
        yes: Post.where("date(created_at) = ?", date).sum(:yes),
        no: Post.where("date(created_at) = ?", date).sum(:no)
      }
    end
  end
end
