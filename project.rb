def convertToASCII(value)
    ((value/255)*65)-1
end


require 'mini_magick'
image = MiniMagick::Image.open("Headshot.jpg")

puts "Successfully loaded image!"
width = image.dimensions[0]
height = image.dimensions[1]

puts "Image size: " + image.dimensions.to_s


puts "Constructing pixel matrix..."
RGB_tuple_matrix = image.get_pixels
puts "Success!"

puts "Constructing brightness matrix..."

brightness_matrix = []


#Loop to populate brightness matrix

RGB_tuple_matrix.each {|row|
    new_row = []
    row.each {|rgb_val|
        new_row.push((rgb_val[0]+rgb_val[1]+rgb_val[2])/3)
    }
    brightness_matrix.push(new_row)
}


puts "Success!"


asciiScale = '`^\",:;Il!i~+_-?][}{1)(|\\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$'
ascii_matrix = ''

brightness_matrix.each {|row|
    new_row = ''
    row.each {|brightness_value|
       2.times do
           new_row += asciiScale[convertToASCII(brightness_value.to_f/255*65-1)]
        end
    }
    ascii_matrix += new_row
    ascii_matrix += "\n"
}

puts "Success!"
print ascii_matrix

#
#print ascii_matrix
#
