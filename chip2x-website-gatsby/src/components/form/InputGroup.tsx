import * as React from "react"
import { Link } from "gatsby"
import { cx } from "@emotion/css"
import * as Color from "color"

import theme from "../../constants/theme"

/**
 * InputGroup
 */
type Props = {
  onChange: (e: React.ChangeEvent<HTMLInputElement>) => void
  type: "text"
  name: string
  label: string
  placeholder: string
  value: string
}

export default function InputGroup({ onChange, type, name, label, placeholder, value }: Props) {
  return (
    <fieldset>
      <label className="block text-sm2 md:text-md text-accent1 resetLeading mb-10" htmlFor={name}>
        {label}
      </label>

      <input
        css={{ lineHeight: "normal" }}
        className="text-sm2 md:text-md text-text1 w-full h-48 md:h-60 lg:h-80 px-12 md:px-16 lg:px-20 rounded-md"
        onChange={onChange}
        type={type}
        name={name}
        placeholder={placeholder}
        value={value}
      />
    </fieldset>
  )
}
