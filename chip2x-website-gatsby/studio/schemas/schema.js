import createSchema from "part:@sanity/base/schema-creator"
import schemaTypes from "all:part:@sanity/base/schema-type"

import * as localized from "./localized"
import * as objects from "./objects"
import * as singletons from "./singletons"
import * as documents from "./documents"

export default createSchema({
  name: "default",
  types: schemaTypes.concat([
    ...Object.values(localized),
    ...Object.values(objects),
    ...Object.values(singletons),
    ...Object.values(documents),
  ]),
})
