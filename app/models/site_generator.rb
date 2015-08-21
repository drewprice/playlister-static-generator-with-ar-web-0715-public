class SiteGenerator
  attr_accessor :rendered_path

  def initialize(rendered_path)
    @rendered_path = rendered_path
  end

  def build_index
    FileUtils.mkdir_p(rendered_path) unless File.exist? rendered_path

    template = File.read('app/views/index.html.erb')

    File.open("#{rendered_path}/index.html", 'w') do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_artists_index
    path = "#{rendered_path}/artists"

    FileUtils.mkdir_p(path) unless File.exist? path

    template = File.read('app/views/artists/index.html.erb')

    File.open("#{path}/index.html", 'w') do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_artist_page
    path = "#{rendered_path}/artists"

    FileUtils.mkdir_p(path) unless File.exist? path

    template = File.read('app/views/artists/show.html.erb')

    erb_template = ERB.new(template)

    Artist.all.each do |artist|
      @artist = artist

      File.open("#{path}/#{artist.to_slug}.html", 'w') do |f|
        f.write erb_template.result(binding)
      end
    end
  end

  def build_genres_index
    path = "#{rendered_path}/genres"

    FileUtils.mkdir_p(path) unless File.exist? path

    template = File.read('app/views/genres/index.html.erb')

    File.open("#{path}/index.html", 'w') do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_genre_page
    path = "#{rendered_path}/genres"

    FileUtils.mkdir_p(path) unless File.exist? path

    template = File.read('app/views/genres/show.html.erb')

    erb_template = ERB.new(template)

    Genre.all.each do |genre|
      @genre = genre

      File.open("#{path}/#{genre.to_slug}.html", 'w') do |f|
        f.write erb_template.result(binding)
      end
    end
  end

  def build_songs_index
    path = "#{rendered_path}/songs"

    FileUtils.mkdir_p(path) unless File.exist? path

    template = File.read('app/views/songs/index.html.erb')

    File.open("#{path}/index.html", 'w') do |f|
      f.write ERB.new(template).result(binding)
    end
  end

  def build_song_page
    path = "#{rendered_path}/songs"

    FileUtils.mkdir_p(path) unless File.exist? path

    template = File.read('app/views/songs/show.html.erb')

    erb_template = ERB.new(template)

    Song.all.each do |song|
      @song = song

      File.open("#{path}/#{song.to_slug}.html", 'w') do |f|
        f.write erb_template.result(binding)
      end
    end
  end
end
