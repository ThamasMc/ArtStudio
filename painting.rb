require 'chunky_png'

def check_neighborhood(array, x, y)
  elem_sum = 0
  elem_sum += array[x - 1][y + 1] #LG
  elem_sum += array[x][y + 1]     #NG
  elem_sum += array[x + 1][y + 1] #CG
  elem_sum += array[x - 1][y]     #LN
  elem_sum += array[x][y]         #N
  elem_sum += array[x + 1][y]     #CN
  elem_sum += array[x - 1][y - 1] #LE
  elem_sum += array[x][y - 1]     #NE
  elem_sum += array[x + 1][y - 1] #CE
  elem_sum
end

def check_neighborhood_toroid(array, x, y)
  north = y + 1
  south = y - 1
  east = x + 1
  west = x - 1

  north = 0 if north >= array[x].size
  east = 0 if east >= array.size

  elem_sum = 0
  elem_sum += array[west][north]  #LG
  elem_sum += array[x][north]     #NG
  elem_sum += array[east][north]  #CG
  elem_sum += array[west][y]      #LN
  elem_sum += array[x][y]         #N
  elem_sum += array[east][y]      #CN
  elem_sum += array[west][south]  #LE
  elem_sum += array[x][south]     #NE
  elem_sum += array[east][south]  #CE
  elem_sum
end

image_height = 800
image_width = 800

num_seeds = 90
num_cycles = 5000000

pixel_arr = Array.new(image_width) { Array.new(image_height, 0) }

#Seeding the anchors
num_seeds.times do
  rand_x = rand(image_width)
  rand_y = rand(image_height)
  pixel_arr[rand_x][rand_y] = 1
end

#Simulating Particles
num_cycles.times do
  rand_x = rand(image_width)
  rand_y = rand(image_height)

# Skip if it's already active
  next if pixel_arr[rand_x][rand_y] == 1

  neighbor_sum = check_neighborhood_toroid(pixel_arr, rand_x, rand_y)
  if(neighbor_sum >= 1)
    pixel_arr[rand_x][rand_y] = 1
  end
end

png = ChunkyPNG::Image.new(image_width, image_height, ChunkyPNG::Color.rgb(255, 255, 255))

#Coloring the Pixels
image_height.times do |i|
  image_width.times do |j|
    if(pixel_arr[i][j] == 1)
      png[i, j] = ChunkyPNG::Color.rgba(0, 0, 255, 255)
    end
  end
end

png.save('painting.png', interlace: true)
