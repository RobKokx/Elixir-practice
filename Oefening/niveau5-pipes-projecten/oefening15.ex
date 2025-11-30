# oefening15.exs

defmodule TextProcessor do
  # 1. Capitalize elke eerste letter van elk woord
  def capitalize_words(tekst) do
    tekst
    |> String.split(" ")
    |> Enum.map(&String.capitalize/1)
    |> Enum.join(" ")
  end

  # 2. Verwijder woorden korter dan n letters
  def remove_short_words(tekst, min_length) do
    tekst
    |> String.split(" ")
    |> Enum.filter(fn woord -> String.length(woord) >= min_length end)
    |> Enum.join(" ")
  end

  # 3. Tel aantal woorden
  def word_count(tekst) do
    tekst
    |> String.split(" ")
    |> length()
  end

  # 4. BONUS: Verwijder leestekens
  def remove_punctuation(tekst) do
    # Hint: gebruik String.replace met regex ~r/[[:punct:]]/
    String.replace(tekst, ~r/[[:punct:]]/, "")
  end

  # 5. Complete processing pipeline
  def process(tekst, min_word_length \\ 3) do
    tekst
    |> String.trim()
    |> String.downcase()
    |> remove_punctuation()
    |> remove_short_words(min_word_length)
  end

  def reverse_words(string) do
    string
    |> String.split(" ")
    |> Enum.reverse()
    |> Enum.join(" ")
  end

  def longest_word(string) do
    string
    |> String.split(" ")
    |> Enum.map(fn x -> {x, String.length(x)} end)
    |> Enum.max_by(fn {_word, len} -> len end)
    |> elem(0)
  end

  def count_vowels(string) do
    vowel_list = ["a","i","o","u","e"]
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.count(fn x -> x in vowel_list end)
  end

  def pig_latin(tekst) do
    [head | tail] = String.graphemes(tekst)
    result = Enum.join(tail) <> head <> "ay"
  end
end

# === TEST JE CODE ===

# Test 1: Capitalize
IO.puts("\n=== TEST 1: Capitalize ===")
tekst1 = "hallo wereld dit is elixir"
result1 = TextProcessor.capitalize_words(tekst1)
IO.puts("Voor: #{tekst1}")
IO.puts("Na: #{result1}")

# Test 2: Remove short words
IO.puts("\n=== TEST 2: Remove Short Words ===")
tekst2 = "ik ga nu op de fiets naar het park"
result2 = TextProcessor.remove_short_words(tekst2, 3)
IO.puts("Voor: #{tekst2}")
IO.puts("Na (min 3 letters): #{result2}")

# Test 3: Word count
IO.puts("\n=== TEST 3: Word Count ===")
tekst3 = "een twee drie vier vijf"
count = TextProcessor.word_count(tekst3)
IO.puts("Tekst: #{tekst3}")
IO.puts("Aantal woorden: #{count}")

# Test 4: Complete pipeline
IO.puts("\n=== TEST 4: Complete Pipeline ===")
tekst4 = "  HALLO, dit is een TEST! Met wat korte woorden zoals: a, en, is.  "
result4 = TextProcessor.process(tekst4, 4)
IO.puts("Voor: #{tekst4}")
IO.puts("Na processing: #{result4}")
woorden = TextProcessor.word_count(result4)
IO.puts("Woorden over: #{woorden}")

#test 5: reverse words
IO.puts("\n=== TEST 5: reverse words ===")
start_input = "een twee drie vier"
output = TextProcessor.reverse_words(start_input)
IO.puts("Voor: #{start_input}")
IO.puts("Na de wissel: #{output}")

#test 6: longest word
IO.puts("\n=== TEST 6: reverse words ===")
start_input = "ik programmeer graag in elixir"
output = TextProcessor.longest_word(start_input)
IO.puts("the orginal input was: #{start_input}")
IO.puts("The longest word in that string is: #{output}")

#test 7: vowels
IO.puts("\n=== TEST 7: vowels counted ===")
start_input = "Automonteur"
output = TextProcessor.count_vowels(start_input)
IO.inspect(output)
IO.puts("Het woord was #{start_input}")
IO.puts("en dit woord heeft #{output} klinkers")

#test8: pig latin
IO.puts("\n=== TEST 8: Pig latin ===")
start_input = "Elixir"
output = TextProcessor.pig_latin(start_input)
IO.puts("Het begin woord was #{start_input}")
IO.puts("De output was daarva: #{output}")
