import { toSafeInteger, get, isInteger } from 'lodash';
import { ParametersException } from 'lin-mizar';

function getSafeParamId (ctx) {
  const id = toSafeInteger(get(ctx.params, 'id'));
  if (!isInteger(id)) {
    throw new ParametersException({
      code: 10030
    });
  }
  return id;
}

function isOptional (val) {
  // undefined , null , ""  , "    ", 皆通过
  if (val === undefined) {
    return true;
  }
  if (val === null) {
    return true;
  }
  if (typeof val === 'string') {
    return val === '' || val.trim() === '';
  }
  return false;
}

/* 正确返回 */
function success (ctx, data) {
  data.code = 200;
  data.success = true
  return ctx.json(data);
}

export { getSafeParamId, isOptional, success };
