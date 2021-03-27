import { LinValidator, Rule } from 'lin-mizar';

class CreateOrUpdateSupplierValidator extends LinValidator {
  constructor () {
    super();
    this.name = new Rule('isNotEmpty', '必须传入供应商名');
  }
}

class SupplierListValidator extends LinValidator {
  constructor () {
    super();
    // this.name = new Rule('isNotEmpty', '必须传入客户名');
    this.pageSize = new Rule('isNotEmpty', '必须传入size');
    this.currentPage = new Rule('isNotEmpty', '必须传入Page');
  }
}

class OrUpdateSupplierTypeValidator extends LinValidator {
  constructor () {
    super();
    this.name = new Rule('isNotEmpty', '必须传入类型名');
  }
}

export { CreateOrUpdateSupplierValidator, OrUpdateSupplierTypeValidator, SupplierListValidator };
