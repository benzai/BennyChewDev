import * as React from "react"
import { Link } from "gatsby"
import cx from "classnames"
import * as Color from "color"

import theme from "../../constants/theme"

/**
 * TextAreaGroup
 */
type Props = {
  onChange: (e: React.ChangeEvent<HTMLTextAreaElement>) => void
  name: string
  label: string
  placeholder: string
  value: string
  rows?: number
}

export default function TextAreaGroup({
  onChange,
  name,
  label,
  placeholder,
  value,
  rows = 5,
}: Props) {
  return (
    <fieldset>
      <label className="block text-sm2 md:text-md text-accent1 resetLeading mb-10" htmlFor={name}>
        {label}
      </label>

      <textarea
        css={{ lineHeight: "normal" }}
        className="text-sm2 md:text-md text-text1 w-full h-200 md:h-300 lg:h-400 p-12 md:p-16 lg:p-20 rounded-md"
        onChange={onChange}
        name={name}
        placeholder={placeholder}
        value={value}
        rows={rows}
      />
    </fieldset>
  )
}
