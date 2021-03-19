import { LinValidator, Rule } from 'lin-mizar';

class CreateAddressValidator extends LinValidator {
  constructor () {
    super();
    this.user_id = new Rule('isNotEmpty', '必须传入客户id');
  }
}

class UpDataAddressValidator extends LinValidator {
  constructor () {
    super();
    this.id = new Rule('isNotEmpty', '必须传入地址id');
  }
}
export { CreateAddressValidator, UpDataAddressValidator }
