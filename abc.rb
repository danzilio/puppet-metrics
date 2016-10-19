require 'puppet-metrics'

path = File.expand_path(ARGV[0])

def abc_size(f)
  parser = Puppet::Pops::Parser::EvaluatingParser.new
  abc_metric = PuppetMetrics::Metrics::Abc.new
  program = parser.parse_file(f)
  puts "ABC size for #{f}: #{abc_metric.compute(program.model)}"
end

if File.directory?(path)
  Dir["#{path}/**/*.pp"].each do |f|
    abc_size(f)
  end
else
  abc_size(path)
end
