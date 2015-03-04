def load_credentials_from_config_file
  aws_config_file =
    Pathname.new(Dir.pwd).join('config', 'aws.yml').to_s

  if File.exist? aws_config_file
    YAML.load(File.open(aws_config_file).read)[Rails.env]
  else
    nil
  end
end

aws_configs = load_credentials_from_config_file

if aws_configs
  AWS.config(aws_configs)
else
  fail "Could not load AWS credentials"
end
