class SearchBar extends React.Component {

  constructor() {
    super();
    this.processChange = this.processChange.bind(this);
  }

  processChange() {
    this.props.onUserInput(
      this.refs['filterTextInput'].value
    );
  }

  render() {
    return(
      <form>
        <input type="text"
         className="form-control"
         placeholder="Search Recipes..."
         value={this.props.filterText}
         ref="filterTextInput"
         onChange={this.processChange}
         />
      </form>
    );
  }
}
