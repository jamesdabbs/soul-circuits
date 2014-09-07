def powerlaw(min,max,n)
  max += 1
  pl = ((max**(n+1) - min**(n+1))*rand() + min**(n+1))**(1.0/(n+1))
  (max-1-pl.to_i)+min
end

desc 'Spoof like / play counts'
task :spoof do
  Playlist.find_each do |p|
    p.play_count  = powerlaw(200, 12_000, 2)
    p.like_count  = rand(p.play_count / 5) + 30
    p.share_count = rand(p.play_count / 3) + 50
    p.payout      = nil
    p.save!
  end

  Playlist.order("play_count desc").limit(2).each do |p|
    p.payout = (p.play_count + p.like_count + p.share_count) / 7
    p.save!
  end
end
