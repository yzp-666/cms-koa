import { LinValidator, Rule } from 'lin-mizar';

class SearchValidator extends LinValidator {
  constructor () {
    super();
    this.pageSize = new Rule('isNotEmpty', '必须传入size');
  }
}

class CreateOrUpdataValidator extends LinValidator {
  constructor () {
    super();
    this.name = new Rule('isNotEmpty', '必须传入name');
    // this.author = new Rule('isNotEmpty', '必须传入图书作者');
    // this.summary = new Rule('isNotEmpty', '必须传入图书综述');
    // this.image = new Rule('isLength', '图书插图的url长度必须在0~100之间', {
    //   min: 0,
    //   max: 100
    // });
  }
}

export { CreateOrUpdataValidator, SearchValidator };
