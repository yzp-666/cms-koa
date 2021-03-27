import {NotFound, Forbidden} from 'lin-mizar';
import {Color} from '../model/color';

class ColorDao {
  // 获取列表
  // TODO 第一次获取缓存在服务器中
  async getColorList() {
    const list = await Color.findAll();
    return list;
  }

  // 创建
  // TODO 创建新颜色后更新服务器缓存
  async createColor(v) {
    const verify = await Color.findOne({
      where: {
        name: v.get('body.name')
      }
    });
    if (verify) {
      throw new Forbidden({
        code: 10242
      });
    }
    const color = new Color();
    color.name = v.get('body.name');
    await color.save();
  }

  // 删除
  // TODO 删除颜色后更新服务器缓存
  async delete(id) {
    const color = await Color.findOne({
      where: {
        id
      }
    });
    if (!color) {
      throw new NotFound({
        code: 20023
      });
    }
    color.destroy();
  }
}

export {ColorDao};
