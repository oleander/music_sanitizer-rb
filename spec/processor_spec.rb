describe MusicSanitizer::Processor do
  it "Song - Artist => Song Artist" do
    MusicSanitizer::Processor.new("this is a string - this to").process.should eq("this is a string this to")
  end
  
  it "Song A \"abc def\" => Song - A" do
    MusicSanitizer::Processor.new("Song A \"abc def\"").process.should eq("song a")
  end
  
  it "Sweet Child O' Mine by Guns N' Roses => sweet child o' mine by guns n' roses" do
    MusicSanitizer::Processor.new("Sweet Child O' Mine by Guns N' Roses").process.should eq("sweet child o' mine by guns n' roses")
  end

  it "'Get Lucky - Radio Edit' => 'get lucky'" do
    MusicSanitizer::Processor.new("Get Lucky - Radio Edit").process.should eq("get lucky")
  end

  it "should handle 'Spelmannsvalsen (Remastered)'" do
    MusicSanitizer::Processor.new("Spelmannsvalsen (Remastered)").process.should eq("spelmannsvalsen")
  end
  
  it "Song - A [B + C] => Song - A" do
    MusicSanitizer::Processor.new("Song - A [B + C]").process.should eq("song a")
  end
  
  it "Song - A (Super Song) => Song - A" do
    MusicSanitizer::Processor.new("Song - A (Super Song)").process.should eq("song a")
  end
  
  it "Song A feat. (Super Song) => Song A" do
    MusicSanitizer::Processor.new("Song A feat. (Super Song)").process.should eq("song a")
  end

  it "Daft Punk => Daft Punk" do
    MusicSanitizer::Processor.new("Daft Punk").process.should eq("daft punk")
  end
  
  it "Song A feat.(Super Song) => Song A" do
    MusicSanitizer::Processor.new("Song A feat.(Super Song)").process.should eq("song a")
  end
  
  it "Song A feat.Super B C => Song A B C" do
    MusicSanitizer::Processor.new("Song A feat.Super B C").process.should eq("song a")
  end
  
  it "Song A feat Super B C => Song A B C" do
    MusicSanitizer::Processor.new("Song A feat Super B C").process.should eq("song a b c")
  end
  
  it "A -- B => A B" do
    MusicSanitizer::Processor.new("A -- B").process.should eq("a b")
  end
  
  it "123 A B => A B" do
    MusicSanitizer::Processor.new("123 A B").process.should eq("a b")
  end
  
  it "123 A B.mp3 => A B" do
    MusicSanitizer::Processor.new("123 A B.mp3").process.should eq("a b")
  end
  
  it "01. A B => A B" do
    MusicSanitizer::Processor.new("01. A B").process.should eq("a b")
  end
  
  it " 01. A B => A B" do
    MusicSanitizer::Processor.new(" 01. A B").process.should eq("a b")
  end
  
  it "123 A B.mp3(whitespace) => A B" do
    MusicSanitizer::Processor.new("123 A B.mp3 ").process.should eq("a b")
  end
  
  it "A_B_C_D_E => A B C D E" do
    MusicSanitizer::Processor.new("A_B_C_D_E").process.should eq("a b c d e")
  end
  
  it "100_A=> A" do
    MusicSanitizer::Processor.new("100_A").process.should eq("a")
  end
  
  it "don't => don't (no change)" do
    MusicSanitizer::Processor.new("don't").process.should eq("don't")
  end

  it "A 'don' B => A B" do
    MusicSanitizer::Processor.new("A 'don' B").process.should eq("a b")
  end

  it "Video Games - Album Version Remastered => Video Games" do
    MusicSanitizer::Processor.new("Video Games - Album Version Remastered").process.should eq("video games")
  end

  it "r.e.m - Losing My Religion" do
    MusicSanitizer::Processor.new("r.e.m").process.should eq("r.e.m")
    MusicSanitizer::Processor.new("r.e.m.").process.should eq("r.e.m.")
  end

  it "Knockin' On Heaven's Door" do
    MusicSanitizer::Processor.new("Knockin' On Heaven's Door").process.should eq("knockin' on heaven's door")
  end

  it "I Love Rock'n'roll => i love rock'n'roll" do
    MusicSanitizer::Processor.new("I Love Rock'n'roll").process.should eq("i love rock'n'roll")
  end

  it "Jason Derulo - Undefeated" do
    MusicSanitizer::Processor.new("Undefeated").process.should eq("undefeated")
  end

  it "Da Bop - Video Edit" do
    MusicSanitizer::Processor.new("Da Bop - Video Edit").process.should eq("da bop")
  end

  it "will.i.am - Scream & Shout" do
    MusicSanitizer::Processor.new("Scream & Shout").process.should eq("scream & shout")
    MusicSanitizer::Processor.new("will.i.am").process.should eq("will.i.am")
  end

  it "handles 'I was made for loving you Official FULL HD'" do
    MusicSanitizer::Processor.new("I was made for loving you Official FULL HD").process.should eq("i was made for loving you")
  end
end