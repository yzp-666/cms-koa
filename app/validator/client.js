import { LinValidator, Rule } from 'lin-mizar';

class CreateOrUpdateClientValidator extends LinValidator {
    constructor () {
        super();
        this.name = new Rule('isNotEmpty', '必须传入客户名');
    }
}

class OrUpdateClientTypeValidator extends LinValidator {
    constructor () {
        super();
        this.name = new Rule('isNotEmpty', '必须传入属性名');
    }
}

export { CreateOrUpdateClientValidator, OrUpdateClientTypeValidator };
