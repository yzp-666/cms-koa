import { LinValidator, Rule } from 'lin-mizar';

class CreateOrUpdateClientValidator extends LinValidator {
    constructor () {
        super();
        this.name = new Rule('isNotEmpty', '必须传入客户名');
        // this.author = new Rule('isNotEmpty', '必须传入图书作者');
        // this.summary = new Rule('isNotEmpty', '必须传入图书综述');
        // this.image = new Rule('isLength', '图书插图的url长度必须在0~100之间', {
        //     min: 0,
        //     max: 100
        // });
    }
}

class OrUpdateClientTypeValidator extends LinValidator {
    constructor () {
        super();
        this.name = new Rule('isNotEmpty', '必须传入属性名');
    }
}

export { CreateOrUpdateClientValidator, OrUpdateClientTypeValidator };
