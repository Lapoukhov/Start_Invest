module TttagsHelper
  def tttag_cloud(tttags)
    tttags.each do |tttag|
      yield(tttag)
    end
  end
end