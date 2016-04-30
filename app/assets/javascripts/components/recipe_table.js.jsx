class RecipeTable extends React.Component {
  render() {
    const rows = [];
    const { recipes, filterText, loggedIn } = this.props;

    recipes.beers.map((recipe) => {
      if (recipe.name.search(new RegExp(filterText, "i")) == -1) {
        return;
      } else {
        rows.push(<RecipeRow recipe={recipe} key={recipe.id} />);
      }
    });

    if (loggedIn) {
     showDownload = <th>Download</th>
    }

    return (
      <table className="table table-hover">
        <thead>
          <tr>
            <th>Name</th>
            <th>Style</th>
            <th>OG</th>
            <th>FG</th>
          </tr>
        </thead>
        <React.addons.CSSTransitionGroup component="tbody" transitionName="example" transitionEnterTimeout={500} transitionLeaveTimeout={300}>
          {rows}
        </React.addons.CSSTransitionGroup>
      </table>
    );
  }
}
