require 'rspec'
require_relative 'graph' # replace with the actual file name

describe Graph do
  before :each do
    @graph = Graph.new
  end

  it 'finds an element in the graph' do
    @graph.add_edge(1, 2)
    @graph.add_edge(1, 3)
    @graph.add_edge(2, 4)
    @graph.add_edge(3, 5)
    @graph.add_edge(4, 5)

    expect(@graph.dfs(1, 5)).to be true
  end

  it 'returns false if an element is not in the graph' do
    @graph.add_edge(1, 2)
    @graph.add_edge(1, 3)
    @graph.add_edge(2, 4)

    expect(@graph.dfs(1, 5)).to be false
  end

  it 'works with a graph of one node' do
    expect(@graph.dfs(1, 1)).to be true
  end

  it 'returns false if start node is not in the graph' do
    @graph.add_edge(1, 2)

    expect(@graph.dfs(3, 2)).to be false
  end

  it 'returns false if end node is not in the graph' do
    @graph.add_edge(1, 2)

    expect(@graph.dfs(1, 3)).to be false
  end

  it 'works with a disconnected graph' do
    @graph.add_edge(1, 2)
    @graph.add_edge(3, 4)

    expect(@graph.dfs(1, 4)).to be false
  end
end
