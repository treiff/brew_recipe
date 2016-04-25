class RecipeRow extends React.Component {

  componentDidMount() {
    console.log("YES");
  }

  render() {
    return(
      <tr>
        <td>{this.props.recipe.name}</td>
        <td>{this.props.recipe.style}</td>
        <td>{this.props.recipe.og}</td>
        <td>{this.props.recipe.fg}</td>
      </tr>
    );
  }
}
