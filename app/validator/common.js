import { LinValidator, Rule, config } from 'lin-mizar';

class PositiveIdValidator extends LinValidator {
  constructor () {
    super();
    this.id = new Rule('isInt', 'id必须为正整数', { min: 1 });
  }
}

class PaginateValidator extends LinValidator {
  constructor () {
    super();
    this.count = [
      new Rule('isOptional', '', config.getItem('countDefault')),
      new Rule('isInt', 'count必须为正整数', { min: 1 })
    ];
    this.page = [
      new Rule('isOptional', '', config.getItem('pageDefault')),
      new Rule('isInt', 'page必须为整数，且大于等于0', { min: 0 })
    ];
  }
}

class PaginateDeleteValidator extends LinValidator {
  validateConfirmPassword (data) {
    if (Array.isArray(data.body.ids)) {
      for (let item of data.body.ids) {
        if (!(/(^[1-9]\d*$)/.test(item))) {
          return [false, 'id参数错误'];
        } else {
          return true;
        }
      }
    } else {
      return [false, 'id参数错误'];
    }
    return [false, 'id参数错误'];
  }
}

export { PaginateValidator, PositiveIdValidator, PaginateDeleteValidator };
