import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class ClientType extends Model {
    toJSON () {
        const origin = {
            value: this.id,
            label: this.name // 客户名称
        };
        return origin;
    }
}

ClientType.init(
    {
        id: {
            type: Sequelize.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        name: {
            type: Sequelize.STRING(50),
            allowNull: false
        }
    },
    merge(
        {
            sequelize,
            tableName: 'client_type',
            modelName: 'client_type'
        },
        InfoCrudMixin.options
    )
);

export { ClientType };
