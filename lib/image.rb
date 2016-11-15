class Image 

  def initialize(array)
    @array = array
  end

  def output_image
    @array.each_index do |x|
      sub = @array[x]
      puts sub.join
    end
  end

  def image_transform
    # Loop through inner arrays and if a 1 is found use the x-index +1 or -1 to transform digits above and bellow
    # then use +1 or -1 of the y-index to transform digits from the left and right
    indexes = []
    # The Indexing Loop
    @array.each_index do |x| 
      subarray = @array[x]
      subarray.each_index do |y|
        if subarray[y] == 1
          is_one = true
        else 
          is_one = false
        end

        indexes.push([x, y, is_one])
      end 
    end 

    # !refactor to use indexes instead!
    # The Production Loop
    count = 0
    @array.each_index do |x|
      subarray = @array[x]
      subarray.each_index do |y|
        check = [x, y, true]
        if subarray[y] == 1 && check == indexes[count]
          subarray[y - 1] = 1 if y > 0
          subarray[y + 1] = 1 if y < subarray.length - 1
          @array[x + 1][y] = 1 if x < @array.length - 1
          @array[x - 1][y] = 1 if x > 0
        end
        count += 1
      end
    end 
  end

  def blur(distance)
    (0..distance - 1).each do
      self.image_transform
    end
  end

end



image = Image.new([
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0]
])

image.blur(3)
image.output_image