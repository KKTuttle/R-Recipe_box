require('spec_helper')

describe(Tag) do
  it('validates presence of name') do
    tag = Tag.new({:name => ''})
    expect(tag.save).to(eq(false))
  end
  it('allows user to type a maximum of 15 characters for name') do
    tag = Tag.new({:name => "a".*(16)})
    expect(tag.save).to(eq(false))
  end
end
