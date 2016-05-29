Pod::Spec.new do |s|
  s.name         = "ASCalendar"
  s.version      = "1.0.0"
  s.summary      = "ASCalendar."

  s.description  = <<-DESC
                   ASCalendar.
                   DESC

  s.homepage     = "https://github.com/scamps88/ASCalendar"
  s.license      = "MIT (example)"
  s.author             = { "Alberto Scampini" => "alberto.scampini" }
  s.platform     = :ios, '7.1'
  s.source_files  = "Example/Calendar", "Example/Calendar/*.swift"
  s.resources = "Example/Calendar/*.png"
  s.framework  = 'SystemConfiguration'
  s.requires_arc = true

end
