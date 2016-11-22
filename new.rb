class Array
    def my_reverse()
        arr = self
        r_array = []
        i = -1
        arr.each do
            r_array << arr[i]
            i -= 1
        end
        r_array
    end

    def my_index(obj)
        result = nil
        self.each_with_index do |value, index|
            if value == obj
                result = index
                # break
            end
        end
        result
    end

        # i = -1
        # arr.each do |i|
        #      if arr[i] == arr[i-1]
        #         counter = i
        #      end
        # end
    
    
    # end

end

#  def last_number_index   
#         array.each do
#             if array[i] <=> array[i-1]
#             else
#                 answer = i
#             end

#         end
# puts answer
# end
