task :default => 'jekyll'

task :jekyll do
  sh 'jekyll --lsi'
end
