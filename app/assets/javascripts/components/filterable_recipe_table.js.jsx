class FilterableRecipeTable extends React.Component {

  constructor() {
    super();

    this.processInput = this.processInput.bind(this);
    this.loadRecipesFromServer = this.loadRecipesFromServer.bind(this);

    this.state = {
      filterText: '',
      recipes: { 'beers': [] }
    }
  }

  processInput(filterText) {
    this.setState({
      filterText: filterText
    });
  }

  loadRecipesFromServer() {
    let that = this;
    fetch('http://127.0.0.1:3000/beers.json').then(function(response) {
      return response.json();
    }).then(function(recipes) {
      that.setState({recipes: recipes});
    })
  }

  componentDidMount() {
    this.loadRecipesFromServer();
    setInterval(this.loadRecipesFromServer, 5000);
  }

  render() {
    return(

      <div>
        <SearchBar
          filterText={this.state.filterText}
          onUserInput={this.processInput}
        />
        <RecipeTable
          //url={'http://127.0.0.1:3000/beers.json'}
          //pollInterval={1000}
          loggedIn={this.props.loggedIn}
          recipes={this.state.recipes}
          filterText={this.state.filterText}
        />
      </div>

    );
  }
}
