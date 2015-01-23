describe "Object Mutability and Immutability" do
  context 'Strings' do
    # make a string and assign it to this variable
    my_string = __

    # make an identical string and assign it to this new variable
    same_string = __

    it "has a different object id" do
      expect(my_string.object_id).to_not eq(same_string.object_id)
    end

    # make sure that the variables are of the class 'String'
    it "is a String object" do
      expect(my_string.class).to eq(String)
      expect(same_string.class).to eq(String)
    end
  end

  context 'Symbols' do
    # make a symbol and assign it to this variable
    my_symbol = __

    # make another symbol that's identical to the above symbol, and save it to a new variable
    same_symbol = __

    it "has the same object id" do
      expect(my_symbol.object_id).to eq(same_symbol.object_id)
    end

    # make sure that the variables are of the class 'Symbol'
    it "is a Symbol object" do
      expect(my_symbol.class).to eq(Symbol)
      expect(same_symbol.class).to eq(Symbol)
    end
  end
end
