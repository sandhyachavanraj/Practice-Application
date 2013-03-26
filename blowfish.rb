require 'crypt/blowfish' 

 my $key = pack("H16", "0123456789ABCDEF")
 puts "***********************"
blowfish = Crypt::Blowfish.new("A key up to 56 bytes long")

plainBlock = "ABCD1234"
encryptedBlock = blowfish.encrypt_block(plainBlock)
decryptedBlock = blowfish.decrypt_block(encryptedBlock)

puts encryptedBlock
puts decryptedBlock
