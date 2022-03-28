import * as React from "react"
import { useEffect, useState } from "react"
import { cx } from "@emotion/css"
import * as Color from "color"
import axios from "axios"

import { IFormField } from "../../data/shared"

import theme from "../../constants/theme"
import { InputGroup, TextAreaGroup, Button } from "../"

/**
 * ContactFormSection
 */
type Props = {
  formFields?: IFormField[]
  confirmation: {
    title: string
    text1: string
    button: {
      title: string
    }
  }
}

export default function ContactForm({
  formFields = [
    { element: "input", name: "name", label: "Name", placeholder: "Your name" },
    { element: "input", name: "email", label: "Email", placeholder: "Your email" },
    {
      element: "textarea",
      name: "message",
      label: "Message",
      placeholder: "Please let us know how we can help you.",
    },
  ],
  confirmation,
}: Props) {
  const emailEndPoint = "https://chipchip-api.herokuapp.com/meeru"

  const [isFormValid, setFormValid] = useState(false)
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    message: "",
  })
  const [serverStatus, setServerStatus] = useState({
    isSubmitting: false,
    success: null,
  })

  useEffect(() => {
    checkFormValidation()
  }, [formData])

  function resetForm() {
    setFormValid(false)
    setFormData({
      name: "",
      email: "",
      message: "",
    })
  }

  function checkFormValidation() {
    const emailRegex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i
    emailRegex.test(formData.email) &&
    formData.name !== "" &&
    formData.email !== "" &&
    formData.message !== ""
      ? setFormValid(true)
      : setFormValid(false)
  }

  function handleServerResponse(success: boolean) {
    setServerStatus({
      isSubmitting: false,
      success,
    })
    if (success) {
      resetForm()
    }
  }

  function updateForm(e: any) {
    const { name, value } = e.target
    setFormData({ ...formData, [name]: value })
  }

  async function submitForm(e: any) {
    e.preventDefault()

    setServerStatus({ isSubmitting: true, success: null })

    try {
      const result = await axios({
        method: "post",
        url: emailEndPoint,
        data: formData,
        headers: {
          "Content-Type": "application/json",
        },
      })
      result && handleServerResponse(true)
    } catch {
      handleServerResponse(false)
    }
  }

  return (
    <div className="w-full p-20 md:p-40 lg:p-60 bg-bg3 rounded-md">
      {serverStatus.success ? confirmationGroup() : formGroup()}
    </div>
  )

  function formGroup() {
    if (!formFields || formFields.length === 0) {
      return null
    }

    return (
      <form onSubmit={submitForm}>
        <div className="grid grid-cols-1 gap-30 lg:gap-40">
          {formFields.map(field => {
            return field.element === "input" ? (
              <InputGroup
                onChange={updateForm}
                value={formData[field.name]}
                key={field.name}
                type="text"
                name={field.name}
                label={field.label}
                placeholder={field.placeholder}
              />
            ) : field.element === "textarea" ? (
              <TextAreaGroup
                onChange={updateForm}
                value={formData[field.name]}
                key={field.name}
                name={field.name}
                label={field.label}
                placeholder={field.placeholder}
              />
            ) : null
          })}
          <button
            type="submit"
            disabled={!isFormValid || serverStatus.isSubmitting}
            css={{
              backgroundColor: theme.colors.accent2,
              "&:hover": {
                backgroundColor:
                  !isFormValid || serverStatus.isSubmitting
                    ? theme.colors.accent2
                    : theme.colors.accent2_hover,
              },
            }}
            className={cx(
              !isFormValid ? "opacity-50" : "opacity-100",
              "inline-block outline-none w-full h-60 md:h-80 rounded-md"
            )}>
            <span className="text-sm3 md:text-md text-altText1 resetLeading">
              {serverStatus.isSubmitting ? `One moment please` : `Send`}
            </span>
          </button>
        </div>
      </form>
    )
  }

  function confirmationGroup() {
    return (
      <div className="flex flex-col py-40 md:py-80">
        <div className={cx("flex flex-col")}>
          <img
            className="max-h-300 object-contain"
            src={"/static/images/graphics/illustrations/illustration-home-header.svg"}
            alt={`props.confirmation.title`}
          />

          <div className="h-40 md:h-60" />

          <h3
            className={cx(
              "text-md3 md:text-lg lg:text-lg2 xl:text-lg3 text-text1 text-center",
              "resetLeading"
            )}>
            {confirmation.title}
          </h3>
          <div className="h-20 md:h-30" />
          <p className={cx("text-md md:text-md2 text-text2 text-center")}>{confirmation.text1}</p>

          <div className="h-40 md:h-60" />

          <button
            onClick={() => {
              setServerStatus({
                isSubmitting: false,
                success: null,
              })
            }}
            css={{
              backgroundColor: theme.colors.accent2,
              "&:hover": {
                backgroundColor:
                  !isFormValid || serverStatus.isSubmitting
                    ? theme.colors.accent2
                    : theme.colors.accent2_hover,
              },
            }}
            className={cx("inline-block outline-none w-full h-60 md:h-80 rounded-md")}>
            <span className="text-sm3 md:text-md text-altText1">{`Send another one`}</span>
          </button>
        </div>
      </div>
    )
  }
}
