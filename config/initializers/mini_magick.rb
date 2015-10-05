require "mini_magick"

module MiniMagick
 class Image
  def get_dominant_color
    color = run_command("convert", path, "-format", "%c\n",  "-colors", 1, "-depth", 8, "histogram:info:")
    result = color.match(/(?<=#)(?<!^)(\h{6}|\h{3})/).to_s

    if result
      "##{result}"
    end
  end
 end
end
