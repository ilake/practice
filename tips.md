### gsub and sub are not unavailable in sub-class of String
When you use gusb in block form from sub-class of String, variables such as $1, $2, $`, $&, and $’ will not be set appropriately.

For exmaple:

```ruby

irb(main):001:0> class X < String; def gsub(*args); super; end end
=> nil
irb(main):002:0> X.new('hello').gsub(/(l)/) { $1 + 'm' }
NoMethodError: undefined method `+' for nil:NilClass
    from (irb):2:in `block in irb_binding'
    from (irb):1:in `gsub'
    from (irb):1:in `gsub'
    from (irb):2
    from /Users/aaron/.local/bin/irb:12:in `<main>'
irb(main):003:0>
```

Ya, the SafeBuffers is one of the example. The issue we meet is we try to generate view in the presenter, then parse the result. and you could not get the $1 in the block. The solution is force it to String by to_str, then you could use gsub as usual.

```ruby

  # presenter.rb
  def render_view(options = {})
    av = ActionView::Base.new(ActionController::Base.view_paths)
    av.render(:template => "index.pdf.erb")
  end

  def parsing
    render_view.gsub!( /src=["']+([^:]+?)["']/i ) do |m|
      # $1 etc... will be unavailable
    end
  end

  def fixed_parsing
    render_view.to_str.gsub!( /src=["']+([^:]+?)["']/i ) do |m|
      # $1 etc... will be unavailable
    end
  end
```

reference: https://github.com/rails/rails/pull/2248


---
### Listing all columns in all models
http://strugglingwithruby.blogspot.tw/2013/08/listing-all-columns-in-all-models.html

Get all the models 

```ruby
ActiveRecord::Base.descendants
```

reset_column_information

```ruby
Resets all the cached information about columns, which will cause them to be reloaded on the next request.
```

---

When you use vim, if you select some text and replace others, it is annoying the paste buffer was overwrite by the removed text. you could not paste again and again.
This script is helpful to avoid this situation( put it in ~/.vimrc )

```
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
```
