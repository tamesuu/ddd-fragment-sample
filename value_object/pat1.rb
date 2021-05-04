class Currency
  private_class_method :new

  def self.factory(iso_code)
    new(iso_code)
  end


  def initialize(iso_code)
    # iso code のチェックが入る
    @iso_code = iso_code
  end

  def ==(currency)
    iso_code == currency.iso_code
  end

  attr_reader :iso_code
end

### p Currency.factory(123)
### # エラーが出る
### p Currency.new(456)

# true
a =  Currency.factory(123)
b =  Currency.factory(123)
p a == b

