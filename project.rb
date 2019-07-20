ASCII_SCALE = '`^\",:;Il!i~+_-?][}{1)(|\\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$'

def successAlert
    puts "Success!"
end

def displayImageSize(image)
    puts "Image size: " + image.dimensions.to_s
end

def constructBrightnessMatrix(tuple_matrix)
    brightness_matrix = []
    tuple_matrix.each {|row|
        new_row = []
        row.each {|rgb_val|
            new_row.push((rgb_val[0]+rgb_val[1]+rgb_val[2])/3)
        }
        brightness_matrix.push(new_row)
    }
    return brightness_matrix
end

def createAsciiArt(brightness_matrix)
    ascii_matrix = ''
    brightness_matrix.each {|row|
        new_row = ''
        row.each {|brightness_value|
            2.times do
                new_row += ASCII_SCALE[convertToASCII(brightness_value.to_f/255*65-1)]
            end
        }
        ascii_matrix += new_row
        ascii_matrix += "\n"
    }
    
    return ascii_matrix
end

def convertToASCII(value)
    ((value/255)*65)-1
end


require 'mini_magick'

puts "Loading image..."
image = MiniMagick::Image.open("Headshot.jpg")

successAlert
displayImageSize(image)

puts "Constructing pixel matrix..."
RGB_tuple_matrix = image.get_pixels
successAlert

puts "Constructing brightness matrix..."
brightness_matrix = constructBrightnessMatrix(RGB_tuple_matrix)
successAlert




puts "Creating ASCII art..."
asciiArt = createAsciiArt(brightness_matrix)
successAlert

print asciiArt

