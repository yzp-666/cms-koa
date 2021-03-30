import { LinValidator, Rule } from 'lin-mizar';

class UpdateValidator extends LinValidator {
  constructor () {
    super();
    this.name = new Rule('isNotEmpty', '必须传入客户名');
  }
}

class AllValidator extends LinValidator {
  // eslint-disable-next-line no-useless-constructor
  constructor () {
    super();
  }
}

class ListValidator extends LinValidator {
  constructor () {
    super();
    // this.name = new Rule('isNotEmpty', '必须传入客户名');
    this.pageSize = new Rule('isNotEmpty', '必须传入size');
    this.currentPage = new Rule('isNotEmpty', '必须传入Page');
  }
}

export { UpdateValidator, ListValidator, AllValidator };
