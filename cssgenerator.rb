class CssGenerator
  attr_accessor :positions, :outfile, :animations, :browsers, :outfile

  def initialize
    @browsers = ["", "-webkit-", "-moz-", "-o-", "-ms-"]    
    @outfile = File.open('carousel.css', 'w')

    @positions = Array.new

    # (positionnumber, top, left, right, width, height, margintop, marginleft, marginright, opacity, zindex, transformscale)

    @positions[0] = Position.new(0, "50%", "50%", "auto", "400px", "400px", "-200px", "", "", 1, 1, 1.4) #center -200px marginleft
    @positions[1] = Position.new(1, "50%", "105%", "auto", "400px", "400px", "-200px", "", "", 1, 0, 1) #right
    @positions[2] = Position.new(2, "50%", "160%", "auto", "400px", "400px", "-200px", "", "", 1, 0, 1) #far right
    @positions[3] = Position.new(3, "50%", "160%", "auto", "400px", "400px", "-200px", "", "", 0, -1, 1) #far right invisible
    @positions[4] = Position.new(4, "50%", "-40%", "160%", "400px", "400px", "-200px", "", "", 0, -1, 1) #far left invisible
    @positions[5] = Position.new(5, "50%", "-40%", "160%", "400px", "400px", "-200px", "", "", 1, 0, 1) #far left
    @positions[6] = Position.new(6, "50%", "-5%", "80%", "400px", "400px", "-200px", "", "", 1, 0, 1) #left

    @animationinputs = Array.new

    @animationinputs = [
      ["one", [[0,0],[6,0],[10,1],[16,1],[20,2],[21,3],[22,4],[25,5],[86,5],[90,6],[96,6],[100,0]] ],
      ["two", [[0,6],[6,6],[10,0],[16,0],[20,1],[26,1],[30,2],[31,3],[32,4],[33,5],[96,5],[100,6]] ],
      ["three", [[0,5],[6,5],[10,6],[16,6],[20,0],[26,0],[30,1],[36,1],[40,2],[41,3],[42,4],[43,5],[100,5]] ],
      ["four", [[0,5],[16,5],[20,6],[26,6],[30,0],[36,0],[40,1],[46,1],[50,2],[51,3],[52,4],[53,5],[100,5]] ],
      ["five", [[0,5],[26,5],[30,6],[36,6],[40,0],[46,0],[50,1],[56,1],[60,2],[61,3],[62,4],[63,5],[100,5]] ],
      ["six", [[0,5],[36,5],[40,6],[46,6],[50,0],[56,0],[60,1],[66,1],[70,2],[71,3],[72,4],[73,5],[100,5]] ],
      ["seven", [[0,5],[46,5],[50,6],[56,6],[60,0],[66,0],[70,1],[76,1],[80,2],[81,3],[82,4],[83,5],[100,5]] ],
      ["eight", [[0,5],[56,5],[60,6],[66,6],[70,0],[76,0],[80,1],[86,1],[90,2],[91,3],[92,4],[93,5],[100,5]] ],
      ["nine", [[0,3],[1,4],[2,5],[66,5],[70,6],[76,6],[80,0],[86,0],[90,1],[96,1],[100,2]] ],
      ["ten", [[0,1],[6,1],[10,2],[11,3],[12,4],[13,5],[76,5],[80,6],[86,6],[90,0],[96,0],[100,1]] ] 
    ]

    @animations = Array.new

    for @j in 0..@animationinputs.length-1
      @animations[@j] = Animation.new(@animationinputs[@j][0], @animationinputs[@j][1], @browsers, @outfile, @positions)
    end #for

    self.print_to_file

  end # CssGenerator initialize 



  def print_to_file

    @outfile.puts "body, html {"
    @outfile.puts "\tmargin: 0;"
    @outfile.puts "\toverflow: hidden;"
    @outfile.puts "\theight: 100%;\n"

    # gradient background
    @colorbgtop = "#000000"
    @colorbgbottom = "#5e5d68"
    @outfile.puts "\tbackground: #{@colorbgtop};
    background: linear-gradient(to bottom, #{@colorbgtop} 0%,#{@colorbgbottom} 100%);
  	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#{@colorbgtop}), color-stop(100%,#{@colorbgbottom}));
  	background: -webkit-linear-gradient(top, #{@colorbgtop} 0%,#{@colorbgbottom} 100%);
  	background: -moz-linear-gradient(top, #{@colorbgtop} 0%, #{@colorbgbottom} 100%);
  	background: -o-linear-gradient(top, #{@colorbgtop} 0%,#{@colorbgbottom} 100%);
  	background: -ms-linear-gradient(top, #{@colorbgtop} 0%,#{@colorbgbottom} 100%);
  	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#{@colorbgtop}', endColorstr='#{@colorbgbottom}',GradientType=0 );\n"

    @outfile.puts "}"
    @outfile.puts "\n"

    @outfile.puts "div.panel {"

    @outfile.puts	"\tposition: fixed;"
    @outfile.puts	"\ttop: 50%;"
    @outfile.puts	"\theight: 400px;"      
    @outfile.puts	"\twidth: 400px;"
    @outfile.puts	"\tmargin-top: -200px;"
    @outfile.puts	"\tmargin-left: -200px;\n"

    # gradient background
  	@colortop = "#0c67bd"
  	@colorbottom = "#0f4891"
    @outfile.puts "\tbackground: #{@colortop};
    background: linear-gradient(to bottom, #{@colortop} 0%,#{@colorbottom} 100%);
  	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#{@colortop}), color-stop(100%,#{@colorbottom}));
  	background: -webkit-linear-gradient(top, #{@colortop} 0%,#{@colorbottom} 100%);
  	background: -moz-linear-gradient(top, #{@colortop} 0%, #{@colorbottom} 100%);
  	background: -o-linear-gradient(top, #{@colortop} 0%,#{@colorbottom} 100%);
  	background: -ms-linear-gradient(top, #{@colortop} 0%,#{@colorbottom} 100%);
  	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#{@colortop}', endColorstr='#{@colorbottom}',GradientType=0 );\n"

    # drop shadow
    for @b in 0..@browsers.length
      @outfile.puts "\t#{@browsers[@b]}box-shadow: 0px 0px 6px 0px #000;"
    end 

    # rounded corners
    for @s in 0..@browsers.length
      @outfile.puts "\t#{@browsers[@s]}border-radius: 20px;"
    end

    @outfile.puts "}" #div.panel
    @outfile.puts "\n"

    @outfile.puts "p.paneltext {"
    @outfile.puts "\tcolor: #fff;"
    @outfile.puts "\tfont-family: serif;"
    @outfile.puts "\tfont-weight: 100;"    
    @outfile.puts "\tfont-size: 1.2em;"
    @outfile.puts "\tmargin-left: 25px;"
    @outfile.puts "\ttext-shadow: 1px 0px #333;"
    @outfile.puts "}" #p.paneltext


    for @j in 0..@animations.length-1
      @animations[@j].print_html_elements
    end #for

    for @j in 0..@animations.length-1
      @animations[@j].print_animations
    end #for

    @outfile.close

  end #printtofile



  class Position
    attr_accessor :positionnumber, :top, :left, :right, :width, :height, :margintop, :marginleft, :marginright, :opacity, :zindex, :transformscale

    def initialize(positionnumber, top, left, right, width, height, margintop, marginleft, marginright, opacity, zindex, transformscale)
      @positionnumber = positionnumber
      @top = top
      @left = left
      @right = right
      @width = width
      @height = height
      @margintop = margintop
      @marginleft = marginleft
      @marginright = marginright
      @opacity = opacity
      @zindex = zindex
      @transformscale = transformscale
    end #initialize

  end #class Position



  class Animation
    attr_accessor :element, :position_percentages, :browsers, :outfile, :positions
    @@count = 0

    def initialize(element, position_percentages, browsers, outfile, positions)
      @outfile = outfile
      @browsers = browsers
      @positions = positions
      @element = element
      @animationname = "animation"+element
      @position_percentages = position_percentages
      @@count+=1
    end #initialize


    def print_html_elements
      @outfile.puts "##{@element} {"

      @totalseconds = 30

      for i in 0..@browsers.length-1
        @outfile.puts "\t#{@browsers[i]}animation: #{@animationname} #{@totalseconds}s ease-in-out infinite;" 
      end 

      @outfile.puts "}\n\n"

    end # print_html_elements



    def print_animations

      for @j in 0..@browsers.length-1

        @outfile.puts "@#{@browsers[@j]}keyframes #{@animationname} {"

        for @i in 0..@position_percentages.length-1
          @outfile.print "\t#{@position_percentages[@i][0]}%"
          @outfile.print "\t{ "
          #@outfile.print "top:#{@positions[@position_percentages[@i][1]].top}; "
          if @positions[@position_percentages[@i][1]].left != ""
            @outfile.print "left:#{@positions[@position_percentages[@i][1]].left}; "
          end
          #if @positions[@position_percentages[@i][1]].right != ""
          #  @outfile.print "right:#{@positions[@position_percentages[@i][1]].right}; "
          #end
          #@outfile.print "width:#{@positions[@position_percentages[@i][1]].width}; "
          #@outfile.print "height:#{@positions[@position_percentages[@i][1]].height}; "
          #@outfile.print "margin-top:#{@positions[@position_percentages[@i][1]].margintop}; "
          if @positions[@position_percentages[@i][1]].marginleft != ""
            @outfile.print "margin-left:#{@positions[@position_percentages[@i][1]].marginleft}; "
          end
          #if @positions[@position_percentages[@i][1]].marginright != ""
          #  @outfile.print "margin-right:#{@positions[@position_percentages[@i][1]].marginright}; "
          #end
          @outfile.print "opacity:#{@positions[@position_percentages[@i][1]].opacity}; "
          @outfile.print "z-index:#{@positions[@position_percentages[@i][1]].zindex}; "
          @outfile.print "#{@browsers[@j]}transform:scale(#{@positions[@position_percentages[@i][1]].transformscale}); "
          @outfile.puts "}"
        end # for position_percentages

        @outfile.puts "}\n\n"

      end # for browsers

    end #print_animations

  end #class Animation

end #class CssGenerator


a = CssGenerator.new
