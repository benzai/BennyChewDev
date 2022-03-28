import { ClassNamesArg, CSSInterpolation } from "@emotion/css"

export type IStyleOverride = {
  _className?: React.HTMLAttributes<string>["className"] | ClassNamesArg
  _css?: CSSInterpolation
}
