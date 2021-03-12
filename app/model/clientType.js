import { InfoCrudMixin } from 'lin-mizar';
import { merge } from 'lodash';
import { Sequelize, Model } from 'sequelize';
import sequelize from '../lib/db';

class ClientType extends Model {
    toJSON () {
        const origin = {
            id: this.id,
            typeName: this.typeName
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
        typeName: {
            type: Sequelize.STRING(50),
            allowNull: true
        },
    },
    merge(
        {
            sequelize,
            tableName: 'clientType',
            modelName: 'clientType'
        },
        InfoCrudMixin.options
    )
);

export { ClientType };
