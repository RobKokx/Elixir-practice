# oefening14.ex

#maak een pipeline die:
#start met 1 t/m 10
#filtered op oneven getallen
#vermedigvuldigd met 3
#ze dan optelt
#en uiteraard uitprint
#eitje!


defmodule Pipeline do


  def result(pipeline) when is_list(pipeline) do
    pipeline
    |> Enum.filter(fn x -> rem(x, 2) === 1 end)
    |> Enum.map(fn x -> x * 3 end)
    |> Enum.sum()
  end

end

  pipeline = [1,2,3,4,5,6,7,8,9,10]

result = Pipeline.result(pipeline)
IO.puts("Pipeline voor de opschoning:")
IO.inspect(pipeline)
IO.puts("Het resultaat van de pipeline is: #{result}")
