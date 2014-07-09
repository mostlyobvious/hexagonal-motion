class HelloController < UIViewController
  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor

    @name_field = UITextField.alloc.initWithFrame([[0,0],[130,30]])
    @name_field.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3)
    @name_field.placeholder = "Enter your name"
    self.view.addSubview(@name_field)

    @greet_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @greet_button.frame = [[0,0],[130,30]]
    @greet_button.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 35)
    @greet_button.setTitle("Greet", forState: UIControlStateNormal)
    self.view.addSubview(@greet_button)

    @greet_button.addTarget(self, action: :greet_name, forControlEvents: UIControlEventTouchUpInside)
  end

  def greet_name
    UIAlertView.alloc.initWithTitle("Greetings",
                                    message: "Hello, #{@name_field.text}!",
                                    delegate: self,
                                    cancelButtonTitle: "Restart",
                                    otherButtonTitles: nil
    ).show
  end

  def alertView(alert_view, clickedButtonAtIndex:button_index)
    @name_field.text = ""
  end
end