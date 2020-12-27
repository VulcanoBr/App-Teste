require 'discid'

# Specifying the device is optional. If omitted a platform
# specific default will be used.
device = "/dev/cdrom"
disc = DiscId.read(device)
puts disc.id